# Preview all emails at http://localhost:3000/rails/mailers/usuario_mailer
class UsuarioMailerPreview < ActionMailer::Preview
    def bienvenidos_email
        UsuarioMailer.with(usuario: Usuario.first).bienvenidos_email
    end
end
