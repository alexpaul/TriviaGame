//
//  main.swift
//  TriviaGame
//
//  Created by Alex Paul on 10/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

let game = Game()

let userPrompt = """
Select the type of Trivia you would like to play?
1. Movie Trivia
2. Sports Trivia
3. Music Trivia
4. NYC Trivia
5. Second Grade Math
"""

var playAgain = false

repeat {
  print(userPrompt)
  let userResponse = readLine() ?? ""
  print()
  game.selectTrivia(userResponse.trimmingCharacters(in: .whitespacesAndNewlines))
  print("There are \(game.questionsCount) questions, how many would you like\nto attempt (all, or select number amount e.g (5, 8))?")
  let questionsNubmerResponse = readLine() ?? ""
  game.numberQuestionsPrompt(userResponse: questionsNubmerResponse
    .lowercased()
    .trimmingCharacters(in: .whitespacesAndNewlines))
  repeat {
    guard let question = game.getQuestion() else {
      break
    }
    game.questionsInfo()
    question.info()
    let userAnswer = readLine() ?? ""
    game.checkAnswer(usersAnswer: userAnswer, question: question)
    print()
  }while game.hasMoreQuestions
  game.finalScore()
  print("Do you wish to continue playing? (yes, no)")
  let shouldContinuePlaying = readLine() ?? ""
  if shouldContinuePlaying == "yes" {
    game.reset()
    playAgain = true
  } else {
    playAgain = false
  }
  print()
} while playAgain
