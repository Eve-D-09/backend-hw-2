const queries = {
    addCustomerDetails: (email, password) => {
        return `INSERT INTO customers_details (email, password) 
                        VALUES ("${email}", "${password}")`;
    },
    addCustomer: (name, surname, country) => {
         return `INSERT INTO customers (name, surname, country)
                       VALUES ("${name}", "${surname}", "${country}")`
    }
}

module.exports = queries;