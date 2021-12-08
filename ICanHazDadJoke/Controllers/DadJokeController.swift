//
//  ViewController.swift
//  ICanHazDadJoke

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dadJokesTitle: UILabel!
    @IBOutlet weak var jokes: UIStackView!
    @IBOutlet weak var getJokeButton: GetJokeButton!
    @IBOutlet weak var jokeTypeLabel: UILabel!
    @IBOutlet weak var jokeView: UITextView!
    let jokeViewModel = JokeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getJoke(_ sender: Any) {
        getJokeButton.isUserInteractionEnabled = false
        jokeViewModel.getRandomJoke() { response, error in
            if let error = error {
                self.updateUI(error.localizedDescription)
            }
            if let randomJoke = response {
                self.updateUI(randomJoke.joke)
            }
            
        }
    }
    
    private func updateUI(_ jokeStr: String, _ title: String = "Random Joke") {
        DispatchQueue.main.async {
            self.jokeTypeLabel.text = title
            self.jokeView.text = jokeStr
            self.getJokeButton.isUserInteractionEnabled = true
        }
    }
}

