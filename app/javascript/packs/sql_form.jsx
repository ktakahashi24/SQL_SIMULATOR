import React from 'react'
import axios from 'axios'

class SqlForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      data: {
        sql: 'SELECT * FROM Users'
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
    const data = {
      sql: 'this.state.data.sql',
      test: 'test'
    }
    axios({
      method: 'POST',
      url: '/api/submit_sql?format=json',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content,
      },
      data: {
        sql: this.state.data.sql,
      }
    }).then((res) => {
      console.log(res.data)
    })
  }

  render() {
    return (
      <React.Fragment>
        <h2>Enjoy SQL!!!</h2>
        <textarea className="sql-area__textarea" name="sql" defaultValue={this.state.data.sql} onChange={this.inputChange}/>
        <button onClick={() => {this.submitSql()}}>SQL実行dayo★</button>
      </React.Fragment>
    )
  }
}


export default SqlForm
