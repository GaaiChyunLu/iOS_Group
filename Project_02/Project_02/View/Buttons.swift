import SwiftUI

struct ForgetPassword: View {
    @State var is_presented: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                is_presented.toggle()
            }, label: {
                HStack {
                    Image(systemName: "questionmark.circle")
                    
                    Text("忘记密码")
                        .padding(.trailing, 20)
                }
                .foregroundColor(.gray)
                .sheet(isPresented: $is_presented) {
                    VStack {
                        Text("账号：tim_cook")
                        
                        Text("密码：WatchYourWallet")
                    }
                }
                .foregroundColor(.orange)
            })
        }
    }
}

struct LoginButton: View {
    @State var account: String
    @State var password: String
    @State var is_right: Bool = false
    
    var body: some View {
        Button(action: {
            if (account == "") && (password == "") {
                is_right.toggle()
            }
        }, label: {
            HStack {
                Spacer()
                
                ZStack() {
                    Rectangle()
                        .frame(width: 100, height: 50)
                        .foregroundColor(.orange)
                        .cornerRadius(20)
                    
                    HStack {
                        Text("登录")
                        
                        Image(systemName: "arrow.right.circle")
                    }
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(.white)
                }
            }
            .padding(.trailing, 20)
            .sheet(isPresented: $is_right) {
                VStack {
                    Text("账号：tim_cook")
                    
                    Text("密码：WatchYourWallet")
                }
            }
        })
    }
}
