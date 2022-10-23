module.exports = ({ env }) => ({
  email: {
    config: {
      provider: 'nodemailer',
      providerOptions: {
        host: env('SMTP_HOST'),
        port: env.int('SMTP_PORT', 587),
        auth: {
          user: env('SMTP_USER'),
          pass: env('SMTP_PASSWORD')
        }
      },
      settings: {
        defaultFrom: env('SMTP_FROM'),
        defaultReplyTo: env('SMTP_TO')
      }
    }
  },
  upload: {
    config: {
      provider: 'cloudinary',
      providerOptions: {
        cloud_name: env('CLOUDINARY_NAME'),
        api_key: env('CLOUDINARY_KEY'),
        api_secret: env('CLOUDINARY_SECRET')
      },
      actionOptions: {
        upload: {
          folder: env('CLOUDINARY_FOLDER', 'strapi')
        },
        uploadStream: {
          folder: env('CLOUDINARY_FOLDER', 'strapi')
        },
        delete: {}
      }
    }
  }
})
