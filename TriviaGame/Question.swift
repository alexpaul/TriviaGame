//
//  Question.swift
//  TriviaGame
//
//  Created by Alex Paul on 10/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Question { 
  private var questionPrompt: String
  public private (set) var correctAnswer: String
  private var choices: String
  public private (set) var fact: String
  private var triviaType: TriviaType
  public private (set) var level: Int?
  
  init(questionPrompt: String,
       correctAnswer: String,
       choices: String,
       fact: String,
       triviaType: TriviaType) {
    self.questionPrompt = questionPrompt
    self.correctAnswer = correctAnswer
    self.choices = choices
    self.fact = fact
    self.triviaType = triviaType
  }
  
  init?(dict: [String: Any]) {
    guard let questionPrompt = dict["question"] as? String,
      let correctAnswer = dict["correctAnswer"] as? String,
      let choices = dict["choices"] as? String,
      let fact = dict["fact"] as? String,
      let triviaType = dict["triviaType"] as? String else {
        return nil
    }
    self.init(questionPrompt: questionPrompt,
              correctAnswer: correctAnswer,
              choices: choices,
              fact: fact,
              triviaType: TriviaType(rawValue: triviaType) ?? TriviaType.sportsTrivia)
    self.level = Int(dict["level"] as? String ?? "no level info")
  }
  
  func info() {
    print(questionPrompt)
    print(choices)
  }
}



