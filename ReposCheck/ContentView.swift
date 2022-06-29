//
//  ContentView.swift
//  ReposCheck
//
//  Created by Azhar Anwar on 29/06/22.
//

import SwiftUI
import ColorizeSwift

final class GitStatusHelper {
  public static func runGitStatusScript() -> String {
    let pipe = Pipe()
    
    let file = pipe.fileHandleForReading
    
    let process = Process()      
    process.launchPath = "/bin/sh"
    
    process.currentDirectoryPath = "~/Documents/GitHub/" 
    
    process.arguments = [ "-c", "~/Documents/GitHub/repos-status.sh"]
    
    process.standardOutput = pipe
    process.launch()
    
    let data: Data = file.readDataToEndOfFile()
    
    let gitStatusOutput = String(data: data, encoding: .utf8)
    
    print("Git status: \n\n", gitStatusOutput ?? "")
    
    let firstPass = gitStatusOutput?.replacingOccurrences(of: "[0;35m", with: "")
    let secondPass = firstPass?.replacingOccurrences(of: "[0;31m", with: "")
    let thirdPass = secondPass?.replacingOccurrences(of: "[0m", with: "")
    
    return thirdPass ?? ""
  }
}

struct ContentView: View {
  @State var gitCheckOutput: String = ""
  var body: some View {
    VStack(alignment: .leading, spacing: 24.0) {
      
      Text(gitCheckOutput)
        .font(
          Font
            .system(size: 14)
            .monospaced()
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      Button("Check again") {
        gitCheckOutput = GitStatusHelper.runGitStatusScript()
      }
      .padding()
      
    }
    .padding()
    .onAppear { 
      gitCheckOutput = GitStatusHelper.runGitStatusScript()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
