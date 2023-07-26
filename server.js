const express = require("express");
const app = express();
//  import cars
// const cars = require("./cars.json");



//  add middleware
app.use((req, res, next) => {
  console.log("new request!");
  next();
})

//  pass cars down using middleware, will be available evrywhere inside program
// app.use((req, res, next) => {
//   req.cars = cars;
//   next();
// })

//convert the body to json
app.use(express.json());

// app.use("/get", require("./routes/get"));
// app.use("/delete", require("./routes/delete"));
// app.use("/add", require("./routes/car"));
// app.use("/update", require("./routes/update"));

//  group all routes
app.use("/customer", require("./routes/customer"));
app.use("/car", require("./routes/car"));


const port = process.env.PORT || 6001;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
