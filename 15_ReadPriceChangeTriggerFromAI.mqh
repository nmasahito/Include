//+-------------------------------------------------------------------+
//|                               15_ReadPriceChangeTriggerFromAI.mqh |
//|                                  Copyright 2018, Vladimir Zhbanko |
//+-------------------------------------------------------------------+
#property copyright "Copyright 2018, Vladimir Zhbanko"
#property link      "https://vladdsm.github.io/myblog_attempt/"
#property version   "1.001"  
#property strict
// function to recieve direction from csv file
// version 1.001 date 10.05.2018

//+-------------------------------------------------------------+//
//Function requires input of the symbol 
//+-------------------------------------------------------------+//
/*
User guide:
1. Add global bool variable to EA: e.g.:                     double    AIPriceTriggerPredictionH1;
2. Add function call inside start function to EA: e.g.: AIPriceTriggerPredictionH1 = ReadPriceChangeTriggerFromAI(predictor_periodH1);
3. Adapt Trading Robot conditions to change trading strategy parameters eg.: see Falcon_C
4. Add include call to this file  to EAe.g.:            #include <15_ReadPriceChangeTriggerFromAI.mqh>
*/
double ReadPriceChangeTriggerFromAI(int chart_period)
{
/*
- Function reads the file eg: AI_M15_ChangeAUDCAD.csv
- It will output predicted value of asset change
 
*/
   //define internal variables needed
   double change = 0;         //Variable to store and return predicted price change written in the file
   string res = "0";            //Variable to return result of the function
   int handle;
   string str;
      
   handle=FileOpen("AI_T-"+IntegerToString(chart_period)+".csv",FILE_READ);
   if(handle==-1){Comment("Error - file does not exist"); str = "-1"; } 
   if(FileSize(handle)==0){FileClose(handle); Comment("Error - File is empty"); }
      
       //this will bring the last element
      while(!FileIsEnding(handle)) { str=FileReadString(handle);  }
      
      FileClose(handle);
   //Interpret the file
   if(str == "-1"){change = StringToDouble(str); return(change); } //in anomalous case function will return error '-1'
   else
     {
      change = StringToDouble(str);
     }
   return(change); 
 
} 

