import React from 'react'
import axios from 'axios'

const initialSql = 'SELECT * FROM Users'
const ngWordList = ['DELETE', 'DROP']

class SqlForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      data: {
        sql: initialSql,
        results: [],
        keys: []
      }
    }
    this.inputChange = this.inputChange.bind(this)
    this.checkErrors = this.checkErrors.bind(this)
    this.submitSql = this.submitSql.bind(this)
  }

  inputChange(e) {
    let data = this.state.data
    data[e.target.name] = e.target.value
    this.setState({
      data: data
    })
  }

  checkErrors() {
    const sql = this.state.data.sql.toUpperCase().replace(/\r?\n/g, '').replace(/\s+/g, '')
    console.log(sql)
    console.log(ngWordList)
    console.log(ngWordList.includes(sql))

    for(let n=0;n<ngWordList.length;n++) {
      if (sql.indexOf(ngWordList[n]) > -1) {
        return true
      }
    }
    return false
  }

  submitSql() {
    if (this.checkErrors()) {
      alert('delete、dropは使わないでください（>_<）')
      return false
    }
    const sql = this.state.data.sql.replace(/"/g, "\'")
    axios({
      method: 'POST',
      url: '/api/submit_sql?format=json',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content,
      },
      data: {
        sql: sql,
      }
    }).then((res) => {
      this.setState({
        data: {
          sql: initialSql,
          results: res.data.result,
          keys: res.data.keys
        }
      })
    })
  }

  render() {
    const resultListHeader = this.state.data.keys.map((key, index) =>
      <th key={index}>{key}</th>
    )
    const resultsList = this.state.data.results.map((rst) =>
      <tr>
        {
          rst.map((r, index) =>
            <td key={index}>{r}</td>
          )
        }
      </tr>
    )

    return (
      <React.Fragment>
        <h2>Enjoy SQL!!!</h2>
        <textarea className="sql-area__textarea" name="sql" defaultValue={this.state.data.sql} onChange={this.inputChange}/>
        <button onClick={() => {this.submitSql()}} className="sql-area__submit">SQL実行</button>

        <div className="result">
          <table className="result__table">
            <thead>
              <tr>
                {resultListHeader}
              </tr>
            </thead>
            <tbody>
              {resultsList}
            </tbody>
          </table>
        </div>
      </React.Fragment>
    )
  }
}


export default SqlForm
