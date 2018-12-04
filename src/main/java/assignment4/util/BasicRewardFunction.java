package assignment4.util;

import assignment4.BasicGridWorld;
import burlap.oomdp.core.objects.ObjectInstance;
import burlap.oomdp.core.states.State;
import burlap.oomdp.singleagent.GroundedAction;
import burlap.oomdp.singleagent.RewardFunction;

public class BasicRewardFunction implements RewardFunction {

	int goalX;
	int goalY;

	public static int[][] trapLocations = new int[][]{
            {4,0},
            {6,2},
            {4,4},
            {2,7},
    };

	public static int[][] bonusLocations = new int[][]{
            {3,2},
            {6,3},
    };

	public BasicRewardFunction(int goalX, int goalY) {
		this.goalX = goalX;
		this.goalY = goalY;
	}

	@Override
	public double reward(State s, GroundedAction a, State sprime) {

		// get location of agent in next state
		ObjectInstance agent = sprime.getFirstObjectOfClass(BasicGridWorld.CLASSAGENT);
		int ax = agent.getIntValForAttribute(BasicGridWorld.ATTX);
		int ay = agent.getIntValForAttribute(BasicGridWorld.ATTY);

		// are they at goal location?
		if (ax == this.goalX && ay == this.goalY) {
			return 100.;
		}else {
		    for (int[] i : trapLocations){
		        if (ax == i[0] && ay == i[1]){
		            return -10;
                }
            }
            for (int[] i : bonusLocations){
                if (ax == i[0] && ay == i[1]){
                    return -1.;
                }
            }
        }

		return -1;
	}

}
