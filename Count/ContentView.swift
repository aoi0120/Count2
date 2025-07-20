//
//  ContentView.swift
//  Count
//
//  Created by AoiKobayashi on 2025/07/20.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var result = ""
    
    func judgeResult(count: Int) {
        if count >= 10 {
            result = "プラスの勝ち！"
        } else if count >= 7 {
            result = "プラスが勝ちそう！"
        } else if count <= -10 {
            result = "マイナスの勝ち！"
        } else if count <= -7 {
            result = "マイナスが勝ちそう！"
        } else {
            result = ""
        }
    }
    
    func judgeCorlor(count: Int) -> Color {
        return count < 0 ? .blue : (count > 0 ? .red : .black)
    }
    
    var body: some View {
        VStack {

            Text("\(result)")
                .frame(width: 300, height: 100)
                .font(.system(size: 32))
            Text("\(count)")
                .frame(width: 300, height: 100)
                .font(.system(size: 48))
                .foregroundColor(judgeCorlor(count: count))
                // .foregroundStyle(count < 0 ? .blue : (count > 0 ? .red : .black))
            
            HStack {
                Button(action: {
                    count += 1;
                    judgeResult(count: count)
                    /*
                     if count >= 10 {
                            result = "プラスの勝ち！"
                        } else if count >= 7 {
                            result = "プラスが勝ちそう！"
                        } else if count <= -10 {
                            result = "マイナスの勝ち！"
                        } else if count <= -7 {
                            result = "マイナスが勝ちそう！"
                        } else {
                            result = ""
                        }
                     */
                },label: {
                    Image(systemName: "plus")
                })
                .font(.system(size: 48))
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .background(.red)
                
                Button (action: {
                    count -= 1;
                    judgeResult(count: count)
                }, label: {
                    Image(systemName: "minus")
                })
                .font(.system(size: 48))
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .background(.blue)
                
            }
            .padding()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
