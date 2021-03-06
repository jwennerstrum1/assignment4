package assignment4.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;

import assignment4.BasicGridWorld;
import burlap.oomdp.core.objects.ObjectInstance;
import burlap.oomdp.core.states.State;
import burlap.oomdp.visualizer.ObjectPainter;
import burlap.oomdp.visualizer.StaticPainter;



public class BonusPainter implements StaticPainter {

    private int[][] map;

    public BonusPainter(int[][] map) {
        this.map = map;
    }

    @Override
    public void paint(Graphics2D g2, State s, float cWidth, float cHeight) {

        //walls will be filled in black
        g2.setColor(Color.GREEN);

        //set up floats for the width and height of our domain
        float fWidth = this.map.length;
        float fHeight = this.map[0].length;

        //determine the width of a single cell
        //on our canvas such that the whole map can be painted
        float width = cWidth / fWidth;
        float height = cHeight / fHeight;

        //pass through each cell of our map and if it's a wall, paint a black rectangle on our
        //cavas of dimension widthxheight

        for (int i = 0; i < BasicRewardFunction.bonusLocations.length; i++) {

            //left coordinate of cell on our canvas
            float rx = BasicRewardFunction.bonusLocations[i][0] * width;

            //top coordinate of cell on our canvas
            //coordinate system adjustment because the java canvas
            //origin is in the top left instead of the bottom right
            float ry = cHeight - height - BasicRewardFunction.bonusLocations[i][1] * height;

            //paint the rectangle
            g2.fill(new Rectangle2D.Float(rx, ry, width, height));


        }

    }
}