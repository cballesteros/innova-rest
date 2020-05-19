var dbInstance = require('./connection');

function register(req, res, next) {
    let ova = req.body;
    dbInstance.none('INSERT INTO public."OVAS"('+
            '"TITLE", "SUBJECT", "DESCRIPTION", "CREATOR", "PUBLISHER", "CONTRIBUTOR", "DATE", "TYPE", "FORMAT", "IDENTIFIER", "LANGUAGE", "ALTERNATIVE", "EDUCATION_LEVEL", "RIGHTS", "RIGHTS_HOLDER")' + 
            'values(${title}, ${subject}, ${description}, ${creator}, ${publisher}, ${contributor}, ${date}, ${type}, ${format}, ${identifier}, ${language}, ${alternative}, ${educationLevel}, ${rights}, ${rightsHolder})', ova)
        .then(() => {
            res.status(200).json({
                status: 'success',
                message: 'OVA Registered'
            });
        })
        .catch(error => {
            return next(error);
        });
}

function getAllOvas(req, res, next) {
    dbInstance.any('SELECT * FROM public.\"OVAS\"')
        .then(data => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved all OVAS'
                });
            })
        .catch(error => {
            return next(error);
        });
}

module.exports = {
    getAllOvas: getAllOvas,
    register: register
};