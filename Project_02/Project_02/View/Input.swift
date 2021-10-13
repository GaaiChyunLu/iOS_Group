import SwiftUI

struct AccountInput: View {
    @State var account: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 8)
                .foregroundColor(.orange)
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.primary)
                
                TextField("账号", text: $account)
                    .foregroundColor(.gray)

            }
            
            Spacer()
        }
        .frame(height: 60)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10, x: 0, y: 10)
        .padding()
    }
}

struct PasswordInput: View {
    @State var password: String
    @State var show_password: Bool = false
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 8)
                .foregroundColor(.gray)
            
            HStack {
                Image(systemName: "lock")
                
                if show_password {
                    TextField("密码", text: $password)
                        .foregroundColor(.gray)
                } else {
                    SecureField("密码", text: $password)
                }
                
                Button(action: {
                    show_password.toggle()
                }, label: {
                    Image(systemName: show_password ? "eye" : "eye.slash")
                        .foregroundColor(show_password ? .blue : .gray)
                })
            }
            
            Spacer()
        }
        .frame(height: 60)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10, x: 0, y: 10)
        .padding()
    }
}

