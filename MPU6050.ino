#include <Wire.h>
#include <MPU6050.h>

MPU6050 mpu;

int16_t ax_offset = 0, ay_offset = 0, az_offset = 0;

unsigned long previousMillis = 0;
const long interval = 2000; // 更新間隔 (2秒)

void setup() {
  Serial.begin(9600);
  Wire.begin();
  mpu.initialize();

  if (!mpu.testConnection()) {
    Serial.println("MPU6050 接続失敗");
    while (1);
  }

  Serial.println("MPU6050 初期化完了");

  // カリブレーションの実行
  calibrateMPU6050();
  Serial.println("カリブレーション完了");
}

void loop() {
  unsigned long currentMillis = millis();

  // 2秒ごとにデータを更新
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    int16_t ax, ay, az;

    // 加速度データを取得
    mpu.getAcceleration(&ax, &ay, &az);

    // カリブレーションされた値を適用
    ax -= ax_offset;
    ay -= ay_offset;
    az -= az_offset;

    // データを表示
    Serial.print("加速度: ");
    Serial.print("X="); Serial.print(ax);
    Serial.print(" Y="); Serial.print(ay);
    Serial.print(" Z="); Serial.println(az);
  }
}

void calibrateMPU6050() {
  int32_t ax_sum = 0, ay_sum = 0, az_sum = 0;

  const int calibrationTime = 10000; // キャリブレーション時間 (10秒)
  const int sampleInterval = 2;      // サンプル取得間隔 (2ミリ秒)
  const int numReadings = calibrationTime / sampleInterval;

  for (int i = 0; i < numReadings; i++) {
    int16_t ax, ay, az;

    mpu.getAcceleration(&ax, &ay, &az);

    ax_sum += ax;
    ay_sum += ay;
    az_sum += az - 16384; // 16384は1gの値に相当 (±2g設定の場合)

    delay(sampleInterval); // データ取得間隔
  }

  // 平均値を計算してオフセットに設定
  ax_offset = ax_sum / numReadings;
  ay_offset = ay_sum / numReadings;
  az_offset = az_sum / numReadings;
}
