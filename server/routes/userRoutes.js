import express from 'express';
import { createNewUser, login, } from '../controllers/userController.js';
import { admin, protect, supperadmin } from '../middlleware/authMidldleware.js';

const route = express.Router(); // Mini express app for tasks routes

route.post('/create-users', createNewUser);


route.post('/log-in', login);

export default route;