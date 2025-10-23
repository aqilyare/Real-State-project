import jwt from 'jsonwebtoken'

const generateToken = (id) =>{
    return jwt.sign({id},"usermg123456", {})
}

export default generateToken

