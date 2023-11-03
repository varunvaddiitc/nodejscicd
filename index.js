const express = require("express");
const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  res.send("Hello world, this is varun from devops team ");
});
app.listen(PORT, () => {
  console.log("server is listening successfully");
});
