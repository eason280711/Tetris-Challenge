# The war on COVID-19

![The war on COVID-19](img/game.png)

## Installation Steps (Works on iPad Only)
- Clone or Download
- Unzip the WWDC GO.swiftpm.zip
- Airdrop to iPad and open in Swift Playgrounds
Note: Please use the model newer than iPad 9 to get the best experience.

## Overview

Leisure activities during the pandemic were very limited; we couldn't hang out with our friends like we used to be. It seems like video games are the only entertainment we have now.

I want to take this change to make a pandemic simulation game. Players can view the policies, epidemic prevention methods from the government's point of view, and fight against the incoming virus threats. In a pandemic, any oversight would cause the virus to spread across the country.

## Play

This is a virus simulation game. After entering the game, click on the Play button in the main menu to enter the level interface and choose a type of virus to start the game.

In the game, the grid on the left represents each area, when the area is infected, it will turn red, and in the infected state, it will start counting down, and every 5 seconds it will spread (randomly select a grid around it to turn red). The higher the value, the more serious the epidemic is, and the second and third bars represent the public satisfaction and the economic situation of the people, which will drop accordingly (the higher the spread, the faster the public satisfaction and economic situation will drop).

The below card represents the action can be taken, and the upper left corner of the card shows the energy resources will be used for this action, and the total energy will be displayed on the fourth bar. Take the card “distance learning” for example. It will cause the effect of turning a 3*3 grid into a safe area (free from infection for 10 seconds) with the selected cell as the center, and increase the satisfaction level of the people by 1 point.

The main objective of the game is to use actions (cards) to control the epidemic situation level on the left to reduce the spread, and to use the card's accompanying effects to increase people's satisfaction and economic situation so that it does not fall to 0. If you can survive the epidemic for more than 3 minutes, you can win the game.

## What's Next:
I will add different regions and simulate local pandemic prevention policies, I hope that while ensuring the playability, you can know how to control the pandemic in various regions.
