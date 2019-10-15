import React from 'react'
import axios from 'axios'

const initialSql = 'SELECT * FROM Users'

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
    this.submitSql = this.submitSql.bind(this)
  }

  inputChange(e) {
    let data = this.state.data
    data[e.target.name] = e.target.value
    this.setState({
      data: data
    })
  }

  submitSql() {
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
    let index = 0
    const resultListHeader = this.state.data.keys.map((key, index) =>
      <th key={index}>{key}</th>
    )
    const resultsList = this.state.data.results.map((rst) =>
      <tr>
        {
          this.state.data.keys.map((key, index) =>
            <td key={index}>{rst[key]}</td>
          )
        }
      </tr>
    )

    return (
      <React.Fragment>
        <h2>Enjoy SQL!!!</h2>
        <textarea className="sql-area__textarea" name="sql" defaultValue={this.state.data.sql} onChange={this.inputChange}/>
        <button onClick={() => {this.submitSql()}}>SQL実行dayo★</button>

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
