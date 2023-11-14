import webview
import pymssql
import bcrypt

loginFile = open('login.html', 'r+')
loginHtml = loginFile.read()
loginFile.close()

dashboardFile = open('dashboard.html', 'r+')
dashboardHtml = dashboardFile.read()
dashboardFile.close()

profileFile = open('profile.html', 'r+')
profileHtml = profileFile.read()
profileFile.close()

ticketsFile = open('tickets.html', 'r+')
ticketsHtml = ticketsFile.read()
ticketsFile.close()


class ApiMSQLS:
    def __init__(self):
        self.conn = pymssql.connect(server='DESKTOP-OCLJ7GI\SQLEXPRESS', database='materiadbpia')
        self.cursor = self.conn.cursor()
        self.matricula = ""
        self.hashed = b""
        self.userTickets = []
        self.name = ""

    def login(self, matricula, password):
        self.matricula = matricula
        self.cursor.execute("EXEC requestSalt " + self.matricula)
        try:
            salt = self.cursor.fetchall()[0][0]
        except Exception:
            response = {'message': 'Matricula o password incorrectos'}
            return response
        self.hashed = bcrypt.hashpw(password.encode('utf-8'), salt.encode('utf-8'))
        self.cursor.execute("EXEC requestLogin " + self.matricula + ", '" + self.hashed.decode() + "'")
        try:
            self.userTickets = self.cursor.fetchall()
        except Exception:
            response = {'message': 'Matricula o password incorrectos'}
            return response
        self.name = self.userTickets[0][0] + " " + self.userTickets[0][1]
        window.load_html(dashboardHtml)
        response = {'message': 'Accediendo...'}
        return response

    def initialize_dashboard(self):
        response = {'name': self.name}
        print(response)
        return response

    def logout(self):
        self.matricula = ""
        self.hashed = ""
        self.userTickets = []
        self.name = ""
        window.load_html(loginHtml)

    def go_dashboard(self):
        window.load_html(dashboardHtml)

    def go_profile(self):
        window.load_html(profileHtml)

    def change_password(self, password):
        new_salt = bcrypt.gensalt(12)
        new_hashed = bcrypt.hashpw(password.encode('utf-8'), new_salt)
        print("EXEC updatePassword " + self.matricula + ", '" + self.hashed.decode() + "', '" + new_hashed.decode()
              + "', '" + new_salt.decode() + "'")
        try:
            self.cursor.execute("EXEC updatePassword " + self.matricula + ", '" + self.hashed.decode() + "', '"
                                + new_hashed.decode() + "', '" + new_salt.decode() + "'")
            self.conn.commit()
            self.hashed = new_hashed
        except Exception:
            response = {'message': 'Ha ocurrido un error...'}
            return response
        response = {'message': 'El password ha sido cambiado...'}
        return response

    def go_tickets(self):
        window.load_html(ticketsHtml)

    def initialize_tickets(self):
        ticket_options = ""
        for ticket in self.userTickets:
            ticket_options += ("<option value=\"" + str(ticket[3]) + "\">" + ticket[5] + " - " + str(ticket[3])
                               + "</option>\n")
        response = {'name': self.name, 'ticket_options': ticket_options}
        print(response)
        return response


if __name__ == '__main__':
    api = ApiMSQLS()
    window = webview.create_window('Login', html=loginHtml, js_api=api)
    webview.start()
    api.cursor.close()
    api.conn.close()
