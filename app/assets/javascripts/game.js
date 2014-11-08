var userChoice = prompt("Do you choose rock, paper or scissors?");
var computerChoice = Math.random();
console.log(computerChoice);

var assign = function(){
  if (computerChoice > 0 && computerChoice < 0.33) {
    computerChoice = "rock";
  } else if (computerChoice > 0.34 && computerChoice < 0.66)
  {
    computerChoice = "paper";
  } else if (computerChoice > 0.67 && computerChoice < 1) {
    computerChoice = "scissors";
  }
  return computerChoice;
}

var compare = function(choice1, choice2) {
  if (choice1 == choice2) {
    answer = "The result is a tie!";
    alert("The result is a tie!");
  } else if (choice1 === "rock") {
    if (choice2 === "scissors") {
      
      answer = "rock wins";
      alert("rock wins");
     
    } else {
      
      answer = "paper wins";
      alert("paper wins");
    }
  } else if (choice1 === "paper") {
    if (choice2 === "rock") {
      
      answer = "paper wins";
      alert("paper wins");
      
    } else {
      
      answer = "scissors wins";
      alert("scissors wins");
    }
  }
  return answer;

}

assign();
compare(userChoice, computerChoice);
console.log(computerChoice);


