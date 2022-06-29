//
//  ContentView.swift
//  ReposCheck
//
//  Created by Azhar Anwar on 29/06/22.
//

import SwiftUI

final class GitStatusHelper {
  public static func runGitStatusScript(
    withDirectoryPath directoryPath: String = "~/Documents/GitHub/",
    withScriptPath scriptPath: String = "~/Documents/GitHub/repos-status.sh"
  ) -> String {
    let pipe = Pipe()
    
    let file = pipe.fileHandleForReading
    
    let process = Process()      
    process.launchPath = "/bin/sh"
    
    process.currentDirectoryPath = directoryPath
    
    process.arguments = [ "-c", scriptPath]
    
    process.standardOutput = pipe
    process.launch()
    
    let data: Data = file.readDataToEndOfFile()
    
    let gitStatusOutput = String(data: data, encoding: .utf8)
    
    print("Git status: \n\n", gitStatusOutput ?? "")
    
    let firstPass = gitStatusOutput?.replacingOccurrences(of: "[0;35m", with: "")
    let secondPass = firstPass?.replacingOccurrences(of: "[0;31m", with: "")
    
    guard let thirdPass = secondPass?.replacingOccurrences(of: "[0m", with: "") else { return "" }
    
    return thirdPass.isEmpty ? "Check if script path is correct" : thirdPass
  }
}

struct ContentView: View {
  @State var gitCheckOutput: String = ""
  @State private var directoryPath: String = "~/Documents/GitHub/"
  @State private var scriptPath: String = "~/Documents/GitHub/repos-status.sh"
  
  var body: some View {
    VStack(alignment: .leading, spacing: 24.0) {
      
      VStack(alignment: .leading) {
        
        VStack(alignment: .leading, spacing: 8.0) { 
          Text("Directory path")
            .font(.title2)
          
          TextField("Enter directory path", text: $directoryPath)
            .padding()
            .onSubmit {
              checkGitRepos()
            }
        }
        
        VStack(alignment: .leading, spacing: 8.0) { 
          Text("Script path")
            .font(.title2)
          
          TextField("Enter script path", text: $scriptPath)
            .padding()
            .onSubmit {
              checkGitRepos()
            }
        }
      }
      .padding()
      
      ScrollView(.vertical, showsIndicators: true) { 
        Text(gitCheckOutput)
          .font(
            Font
              .system(size: 14)
              .monospaced()
          )
          .transition(.slide)
          .id("gitCheckOutput" + gitCheckOutput)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      
      Button("Check again") {
        checkGitRepos()
      }
      .padding()
      
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .onAppear { 
      checkGitRepos()
    }
  }
  
  private func checkGitRepos() {
    gitCheckOutput = "Checking..."
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { 
      self.gitCheckOutput = GitStatusHelper.runGitStatusScript(withDirectoryPath: directoryPath, withScriptPath: scriptPath)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
