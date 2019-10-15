import React from 'react'
import ReactDOM from 'react-dom'

import SqlForm from "./sql_form"

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <SqlForm/>,
    document.body.appendChild(document.createElement('div')),
  )
})