
class GasEconomy{

  List<double> getpercents(List<double> gasraw, List<double> gasavg, List<double> gasbias){
    List<double> percents = [];
    print("gasraw:$gasraw");
    print("gasbias:$gasbias");
    print("gasavg:$gasavg");
    for(int i = 0; i < gasraw.length; i++){
      double percent = (((gasraw[i] - gasavg[i])*gasbias[i]) / gasavg[i] + 0.5);
      if(percent < 0){
        percent = 0;
      }
      if(percent > 1){
        percent = 1;
      }
      percents.add(percent);
    }
    return percents;
  }

  double getemissionpercent(List<double> gaspercent){
    double emissionpercent = 0.0;
    for(int i = 0; i < gaspercent.length; i++){
      emissionpercent += gaspercent[i];
    }
    return emissionpercent / gaspercent.length;
  }
}