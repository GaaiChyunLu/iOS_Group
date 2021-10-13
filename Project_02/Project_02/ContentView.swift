import SwiftUI

struct ContentView: View {
    @State var account: String = ""
    @State var password: String = ""
    @State var show_password: Bool = false
    @State var is_presented: Bool = false
    
    var body: some View {
        VStack {
            Login()
            
            HStack {
                Rectangle()
                    .frame(width: 8)
                    .foregroundColor(.orange)
                
                HStack {
                    Image(systemName: "person")
                    
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
            
            HStack {
                Rectangle()
                    .frame(width: 8)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.primary)
                    
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
            
            
            
            ForgetPassword()
                .padding(.bottom, 50)
            
            Button(action: {
                is_presented.toggle()
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
                .sheet(isPresented: $is_presented) {
                    VStack {
                        if (account == "tim_cook") && (password == "WatchYourWallet") {
                            Text("登录成功")
                        } else {
                            Text("账号或密码错误")
                        }
                    }
                }
            })
        }
    }
}

struct Login: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "bubble.right.circle")
                            .font(.system(size: 40))
                            .foregroundColor(.orange)
                        
                        Text("清水河畔")
                            .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.primary)
                    }
                    
                    Text("登录以继续")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
