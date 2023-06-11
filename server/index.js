const express = require('express')
const app = express()
const port = 3000

let requestId = 0
let sendResponse = (res) => {
  res.send({
    time: new Date().toLocaleTimeString(),
    request: requestId++
  })
}

/**
 * Default endpoint
 */
app.get('/', (_, res) => {
  sendResponse(res)
})

/**
 * Endpoint encouraging client-side caching
 */
app.get('/cache', (req, res) => {
  res.set('Cache-Control', 'public, max-age=31557600, s-maxage=604800'); // one year
  sendResponse(res)
})

/**
 * Endpoint explicitly disallowing client-side caching
 */
app.get('/no-cache', (req, res) => {
  res.set('Cache-Control', 'no-cache');
  sendResponse(res)
})

app.listen(port, () => {
  console.log(`listening on port ${port}`)
})