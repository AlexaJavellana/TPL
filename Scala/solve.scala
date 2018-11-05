object Caesar {
  private val uppercase ='A' to 'Z';
  private val lowercase ='a' to 'z';

  def encrypt(csrString:String, key:Int)=csrString.map{ c =>
    if(uppercase.contains(c)) {
      swap(uppercase, c, key);
    }
    else if(lowercase.contains(c)) {
      swap(lowercase, c, key);
    }
  }

  private def swap(alphaRange:IndexedSeq[Char], c: Char, key: Int)={
    alphaRange((c - alphaRange.head + key + alphaRange.size) % alphaRange.size);
  }

  def main(args: Array[String]) {
    var csrString : String = "";
    var originalMsg : String = "";
    var maxShift : Int = 0;
    var start : Int = 0;

    println("Welcome to the program to solve a ceaser cipher. First, put in the original message: ");
    csrString = scala.io.StdIn.readLine();
    println("Max shift value: ");
    maxShift = scala.io.StdIn.readInt();

    originalMsg = csrString; 
    println("Message: " + originalMsg);

    for(start <- 0 until maxShift + 1) {
      csrString = originalMsg;
      val encCipher = Caesar.encrypt(csrString, start);
      val encStr = encCipher.mkString;
      println("Caesar " + start + ": " + encStr);
    }
  }
}

