import React from 'react'
import ReactDOM from 'react-dom'

import SqlForm from "./sql_form"

const sqlForm = document.getElementsByClassName('main-body__sql')
document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <SqlForm/>,
    sqlForm[0].appendChild(document.createElement('div')),
  )
})