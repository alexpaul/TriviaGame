//
//  Game.swift
//  TriviaGame
//
//  Created by Alex Paul on 10/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
  
  // MARK: Properties of Game
  
  private var questions = [Question]()
  private var score = 0
  private var totalQuestions = 0
  
  var hasMoreQuestions: Bool {
    return !questions.isEmpty
  }
  
  var questionsCount: Int {
    return questions.count
  }
  
  // MARK: Methods of Game
  func getQuestion() -> Question? {
    questions.shuffle()
    //userQuestionsAmount -= 1
    return questions.popLast()
  }
  
  func createQuestions(_ triviaType: TriviaType) {
    for dict in Trivia.data {
      if let unwrappedTrivia = dict["triviaType"] as? String {
        if unwrappedTrivia == triviaType.rawValue {
          if let question = Question(dict: dict) {
            questions.append(question)
          }
        }
      }
    }
    totalQuestions = questions.count
  }
  
  func checkAnswer(usersAnswer: String, question: Question) {
    if usersAnswer == question.correctAnswer {
      score += 1
      print("Correct Answer.\n\(question.fact)")
    } else {
      print("Wrong answer. Answer is \(question.correctAnswer)\n\(question.fact)")
    }
  }
  
  func finalScore() {
    print("Your final score is \(score) out of \(totalQuestions)")
  }
  
  func reset() {
    score = 0
    questions.removeAll()
  }
  
  func selectTrivia(_ userResponse: String) {
    switch userResponse {
    case "1":
      createQuestions(.movieTrivia)
    case "2":
      createQuestions(.sportsTrivia)
    case "3":
      createQuestions(.musicTrivia)
    case "4":
      createQuestions(.nycTrivia)
    case "5":
      createQuestions(.secondGradeMath)
    default:
      print("Trivia type is unavailable")
    }
  }
  
  func questionsInfo() {
    if questions.isEmpty {
      print("Last question.\n")
    } else {
      print("There are \(questions.count + 1) questions left.\n")
    }
  }
  
  func numberQuestionsPrompt(userResponse: String) {
    if userResponse == "all" {
      totalQuestions = game.questions.count
    } else {
      totalQuestions = Int(userResponse) ?? 0
      sliceQuestions(prefix: totalQuestions)
    }
  }
  
  func sliceQuestions(prefix: Int) {
    guard prefix < questions.count,
      prefix > 0 else { return }
    print("here")
    let slice = questions.prefix(upTo: prefix)
    questions = Array(slice)
  }
}
