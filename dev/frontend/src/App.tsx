import {useState} from 'react'
import {readCall, writeCall} from './api'
import './App.css'


function App() {
  const [message, setMessage] = useState("")
  const [storedMessage, setStoredMessage] = useState("")

  const fetchCall = async () => {
    const data = await readCall()
    setStoredMessage(data)
  }

  return (
    <div className="App">
      <h1>Some Docker thingy</h1>

      <div>
        <p>Store the input</p>
        <div>
          <input type="text" onChange={(e) => setMessage(e.target.value)}/>
        </div>
        <button onClick={
          () => writeCall(message)
        }>
          Save
        </button>

      </div>

      <div>
        <p>Read the message</p>
        <button
          onClick={fetchCall}
        >
          fetch
        </button>
        <p>Value: {storedMessage}</p>
      </div>

    </div>
  )
}

export default App
