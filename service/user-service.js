var dbInstance = require('./connection');

function getAllUsers(req, res, next) {
    dbInstance.any('SELECT * FROM public.\"USERS\"')
        .then(data => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved all users'
                });
            })
        .catch(error => {
            return next(error);
        });
}

function getOneUser(req, res, next) {
    let userId = req.params.dni;
    dbInstance.oneOrNone('SELECT * FROM public.\"USERS\" WHERE \"USER_DNI\" = $1', userId)
        .then(data => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved one user'
                });
        })
        .catch(error => {
            return next(error);
        });
}

function login(req, res, next) {
    let userId = req.body.userId;
    let userPassword = req.body.password;
    dbInstance.oneOrNone('SELECT * FROM public.\"USERS\" WHERE \"USER_DNI\" = $1', userId)
        .then(data => {
            if (data.PASSWORD == userPassword) {
                res.status(200)
                    .json({
                        status: 'success',
                        data: data,
                        message: 'Login successfull'
                    });
            }
            else {
                res.status(401)
                    .json({
                        status: 'fail',
                        data: null,
                        message: 'Password Incorrect'
                    });
            }
        })
        .catch(error => {
            return next(error);
        });
}

function signUp(req, res, next) {
    let user = req.body;
    dbInstance.none('INSERT INTO public.\"USERS\"(\"NAME\", \"LAST_NAME\", \"PASSWORD\", \"USER_DNI\") ' + 
        'values(${name}, ${lastName}, ${password}, ${userId})', user)
        .then(() => {
            res.status(200).json({
                status: 'success',
                message: 'User created'
            });
        })
        .catch(error => {
            return next(error);
        });
}

module.exports = {
    getAllUsers: getAllUsers,
    getOneUser: getOneUser,
    login: login,
    signUp: signUp
};
