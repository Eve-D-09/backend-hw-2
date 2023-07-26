const express = require("express");
const router = express.Router();
//  import math function
const { genRandomString } = require("../utils/math");
const asyncMySQL = require("../mysql/connection");

//  delete
router.delete("/:id", async (req, res) => {
  const id = Number(req.params.id);

  if (Number.isNaN(id)) {
    res.send({ status: 0, reason: "Invalid id" });
    return;
  }

  await asyncMySQL(`DELETE FROM cars WHERE id LIKE ${id};`);
  res.send({ status: 1 });
});

//  add
router.post("/", async (req, res) => {
  const { make, model, year, transmission, customerId } = req.body;
 
  const transmissionType = ["a", "m"];
  
 
  if (
    !make ||
    !model ||
    !year ||
    !transmission ||
    typeof make !== "string" ||
    typeof model !== "string" ||
    typeof transmission !== "string" ||
    typeof year !== "number" ||
    !transmissionType.includes(transmission)
  ) {
    res.send({ status: 0, reason: "Incomplete or invalid request" });
    return;
  }

  try {
    await asyncMySQL(`INSERT INTO cars 
                        (make, model, year, transmission, customer_id ) 
                             VALUES 
                                ("${make}", "${model}","${year}",  "${transmission}", "${customerId}")`);
    res.send({ status: 1 });
  } catch (error) {
    res.send({ status: 0, reason: "Duplicate entry" });
    console.log(error);
    console.log(customerId)
  }
});

//  update
router.patch("/:id", async (req, res) => {
  console.log(req.body, req.params.id);

  const transmissionType = ["a", "m"];

  const id = Number(req.params.id);

  if (Number.isNaN(id)) {
    res.send({ status: 0, reason: "Invalid id" });
    return;
  }

  const { make, model, year, transmission } = req.body;

  try {
    if (make && typeof make === "string") {
      await asyncMySQL(`UPDATE cars SET make = "${make}"
                            WHERE id LIKE "${id}";`);
    }
    if (model && typeof model === "string") {
      await asyncMySQL(`UPDATE cars SET model = "${model}"
                             WHERE id LIKE "${id}";`);
    }
    if (year && typeof year === "number") {
      await asyncMySQL(`UPDATE cars SET year = "${year}"
                             WHERE id LIKE "${id}";`);
    }
    if (
      transmission &&
      typeof transmission === "string" &&
      transmissionType.includes(transmission)
    ) {
      await asyncMySQL(`UPDATE cars SET transmission = "${transmission}"
    WHERE id LIKE "${id}";`);
    }
  } catch (error) {
    res.send({ status: 0, reason: error.sqlMessage });
  }
  res.send({ status: 1 });
});

//  get car by id
router.get("/:id", async (req, res) => {
  const id = Number(req.params.id);

  if (Number.isNaN(id)) {
    res.send({ status: 0, reason: "Invalid id" });
    return;
  }

  const results =
    await asyncMySQL(`SELECT make, model, year, transmission, fuel_type, drive, class
                                      FROM cars 
                                           WHERE id LIKE ${id};`);

  if (results.length > 0) {
    res.send({ status: 1, results });
    return;
  }

  res.send({ status: 0, reason: "Id not found" });
});

module.exports = router;
