import {useState} from 'react'
import {readCall, writeCall} from './api'
import './App.css'


function App() {
  const [message, setMessage] = useState("")
  const [storedMessage, setStoredMessage] = useState("")

  const write = async () => {
    await writeCall(message)
    setMessage("")
  }

  const read = async () => {
    const data = await readCall()
    setStoredMessage(data)
  }

  return (
    <div className="App">
      <h1>Some Docker thingy</h1>
      <div
        style={{display: "flex", flexDirection: "row", alignItems: "center", width: "100%",}}
      >
        <div style={{margin: "auto"}}>
          <h2 style={{marginBottom: "2rem"}}>Store the message</h2>
          <div style={{marginBottom: "2rem"}}>
            <input type="text" onChange={(e) => setMessage(e.target.value)} value={message}/>
          </div>
          <button onClick={write}>Save</button>
        </div>

        <div style={{margin: "auto"}}>
          <h2 style={{marginBottom: "2rem"}}>Read the message</h2>
          <button style={{marginBottom: "2rem"}} onClick={read}>fetch</button>
          <p>Value: {storedMessage}</p>
        </div>
      </div>

    </div>
  )
}

export default App
