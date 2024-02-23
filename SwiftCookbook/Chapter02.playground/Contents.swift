import Foundation

// tuples

func normalizedStarRating(forRating rating: Float, ofPossibleTotal total: Float) -> (starRating: Int, displayString: String) {
    let fraction = rating / total
    let ratingOutOf5 = fraction * 5
    let roundedRating = round(ratingOutOf5) // rounds to the nearest integer
    let numberOfStars = Int(roundedRating)
    let ratingString = "\(numberOfStars) Star Movie"
    
    return (starRating: numberOfStars, displayString: ratingString)
}

let ratingAndDisplayString = normalizedStarRating(forRating: 5, ofPossibleTotal: 10)

let ratingNumber = ratingAndDisplayString.starRating
print(ratingNumber)

let ratingString = ratingAndDisplayString.displayString
print(ratingString)

let (nextNumber, nextString) = normalizedStarRating(forRating: 8, ofPossibleTotal: 10)
print(nextString)
print(nextNumber)

// ordering data with arrays

var moviesToWatch: Array<String> = Array()
moviesToWatch.append("The Shawshank Redemption")
moviesToWatch.append("Ghostbusters")
moviesToWatch.append("Terminator 2")

print(moviesToWatch[0])
print(moviesToWatch[1])
print(moviesToWatch[2])

print(moviesToWatch.count)

moviesToWatch.insert("The Matrix", at: 2)

print(moviesToWatch.count)
print(moviesToWatch)

let firstMovieToWatch = moviesToWatch.first
print(firstMovieToWatch as Any)
let lastMovieToWatch = moviesToWatch.last
print(lastMovieToWatch as Any)

let secondMovieToWatch = moviesToWatch[1]
print(secondMovieToWatch)
moviesToWatch[1] = "Ghostbusters (1984)"
print(moviesToWatch.count)
print(moviesToWatch)

let spyMovieSuggestions: [String] = ["The Bourne Identity", "Casino Royale", "Mission Impossible"]
