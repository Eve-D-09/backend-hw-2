const express = require("express");
const router = express.Router();
const asyncMySQL = require("../mysql/connection");
const {addCustomer, addCustomerDetails} = require("../mysql/queries");

router.post("/", async (req, res) => {
    const { email, password, name, surname, country } = req.body;
     
    try {
       //  store customer in database
        const customer = await asyncMySQL(addCustomer(name, surname, country));
        const customerDetails = await  asyncMySQL(addCustomerDetails(email, password));
        res.send({ status: 1, customerId: customerDetails.insertId });
    } catch (error) {
        res.send({ status: 0});
    }
  
})

module.exports = router;