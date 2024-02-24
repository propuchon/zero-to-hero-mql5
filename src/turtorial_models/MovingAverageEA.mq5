//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"

// moving average parameters
input int maPeriodOne = 50;
input int maPeriodTwo = 100;

input ENUM_MA_METHOD maType = MODE_EMA;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
{
   // define the properties of the moving average 1,2
   return (INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   Print("OnDeinitTest");
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
{

   // create an Arry for serveral prices
   double movingAverageArray1[], movingAverageArray2[];

   // create moving average
   int movingAverageDeifinition1 = iMA(_Symbol, PERIOD_CURRENT, maPeriodOne, 0, maType, PRICE_CLOSE);
   int movingAverageDeifinition2 = iMA(_Symbol, PERIOD_CURRENT, maPeriodTwo, 0, maType, PRICE_CLOSE);

   // sort the price array1, 2 from the current downwards
   ArraySetAsSeries(movingAverageArray1, true);
   ArraySetAsSeries(movingAverageArray2, true);

   // define ma, one line, current cancle, 3 candles, store result
   CopyBuffer(movingAverageDeifinition1, 0, 0, 3, movingAverageArray1);
   CopyBuffer(movingAverageDeifinition2, 0, 0, 3, movingAverageArray2);

   // calculate the current candle
   double movingAverageValue1 = movingAverageArray1[0];
   double movingAverageValue2 = movingAverageArray2[0];

   // Logging
   Comment("MovingAverageValue1: ", NormalizeDouble(movingAverageValue1, 1),
           "\nMovingAverageValue2: ", NormalizeDouble(movingAverageValue2, 1));
}
//+------------------------------------------------------------------+
