const nodemailer = require('nodemailer');
const { google } = require("googleapis");
const OAuth2 = google.auth.OAuth2;


const createTransporter = async () => {

   try {
     const oauth2Client = new OAuth2(
         "857550031803-0uhqhj1lqua3vrq38ntbnjqu2gn0lmjl.apps.googleusercontent.com",
         "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",
         "https://developers.google.com/oauthplayground"
       );

       oauth2Client.setCredentials({
         refresh_token: "1//04zThcFxk00e7CgYIARAAGAQSNwF-L9IrmkdgvTCdd72IFqzLQKjtxi2fKmVX4ZKWfUoKcLcbZW9nfIpWN60eFFj98Au_JLACfUs",
       });

       const accessToken = await new Promise((resolve, reject) => {
         oauth2Client.getAccessToken((err, token) => {
           if (err) {
             console.log("*ERR: ", err)
             reject();
           }
           resolve(token); 
         });
       });

       const transporter = nodemailer.createTransport({
         service: "gmail",
         auth: {
           type: "OAuth2",
           user: "parfaitkouamemks@gmail.com",
           accessToken,
         //   accessToken:"ya29.a0AfB_byAkPIXt3ijQLGmTjBuwJXda_sO7HWUxilZUF87jYVwUwzMB7PSEj8vre9PKsONAsqec7sKcDXR-hVyw5xgrMN5dhfSFP-RmMh1yf9YeKBG-BWg237MBXJPHMWhzEplUIFXwnUglbzJe6UTbf3qpHTr76gkABjHqaCgYKATwSARASFQHGX2Mi2jD8X8r1uCdTUN43OF1luA0171",
           clientId: "857550031803-0uhqhj1lqua3vrq38ntbnjqu2gn0lmjl.apps.googleusercontent.com",
           clientSecret: "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",
           refreshToken: "1//04zThcFxk00e7CgYIARAAGAQSNwF-L9IrmkdgvTCdd72IFqzLQKjtxi2fKmVX4ZKWfUoKcLcbZW9nfIpWN60eFFj98Au_JLACfUs",
         },
       });
       return transporter;
   } catch (err) {
     return err
   }
 };

module.exports = createTransporter;
