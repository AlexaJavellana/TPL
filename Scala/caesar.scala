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

  def decrypt(csrString:String, key:Int)=csrString.map{ c =>
    if(uppercase.contains(c)) {
      swap(uppercase, c, -(key));
    }
    else if(lowercase.contains(c)) {
      swap(lowercase, c, -(key));
    }
  }

  private def swap(alphaRange:IndexedSeq[Char], c: Char, key: Int)={
    alphaRange((c - alphaRange.head + key + alphaRange.size) % alphaRange.size);
  }

  def main(args: Array[String]) {
    var csrString : String = "";
    var originalMsg : String = "";
    var key : Int = 0;

    println("Type your message: ");
    csrString = scala.io.StdIn.readLine();
    println("Enter your cipher: ");
    key = scala.io.StdIn.readInt();

    originalMsg = csrString; 
    println("Message: " + originalMsg);
    val encCipherStr = Caesar.encrypt(csrString, key);
    val encStr = encCipherStr.mkString;
    println("Encrypted message: " + encStr);
    val decCipherStr = Caesar.decrypt(encStr, key);
    val decStr = decCipherStr.mkString;
    println("Decrypted message: " + decStr);
  }
}

