import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

int NUM = 200; // 円の個数
// 座標の配列
float[] posX = new float[NUM];
float[] posY = new float[NUM];
// スピードの配列
float[] speedX = new float[NUM];
float[] speedY = new float[NUM];
// 色の配列
color[] col = new color[NUM];
// 直径の配列
float[] diameter = new float[NUM];


void setup() {
    size(1000, 400 ,P3D);
    canvas = createGraphics(1000, 400, P3D);
    server = new SyphonServer(this, "Processing Syphon");
    canvas.noStroke();
    // 配列の初期値
    for(int i=0; i<NUM; i++){
        posX[i] = random(8,width);
        posY[i] = random(8,height);
        speedX[i] = random(-4,4);
        speedY[i] = random(-4,4);
        col[i] = color(random(255),random(255),random(255),192);
        diameter[i] = random(8,40);
    }
}


void draw() {
    canvas.beginDraw();
    canvas.background(0);

    for(int i=0; i<NUM; i++){
        canvas.noStroke();
        canvas.fill(col[i]);
        canvas.ellipse(posX[i], posY[i], diameter[i], diameter[i]);
        
        // XY座標の移動
        posX[i] = posX[i] + speedX[i];
        posY[i] = posY[i] + speedY[i];

     // 跳ね返り
        if(posX[i] < 0 || posX[i] > width){
            speedX[i] = speedX[i] * -1;
        }
        if(posY[i] < 0 || posY[i] > height){
            speedY[i] = speedY[i]* -1;
        }
    }
    canvas.endDraw();
    server.sendImage(canvas);
}
