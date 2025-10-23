import User from "../models/User.js";
import generateToken from "../token/generateToken.js";

export const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    const isUserExists = await User.findOne({ email: email });

    if (!isUserExists) {
      return res.status(404).json({ 
        success: false,
        data: null,

        message: "user not found" });
    }

    if (isUserExists.password != password) {
      return res.status(400).json({
        success: false,
        data: null,
        message: "wrong password",
      });
    }

    res.status(200).json({
      success: true,
      data: isUserExists,
      message: "Login successfully",
      token: generateToken(isUserExists._id)
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const createNewUser = async (req, res) => {
  try {
    const { name, email, phone, password,role } = req.body;

    const isUserExists = await User.findOne({ email: email });

    if (isUserExists) {
      return res.status(404).json({ 
        success: false,
        data: null,

        message: "user exists" });
    }
    
    const newUser = new User({
      name,
      email,
      phone,
      password,
      role
    });

    const savedUser = await newUser.save();

    res.status(201).json({
        success: true,
        data: savedUser,
        message: "User created successfully"
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
