package nfc.point.model;
import java.util.*;

public interface PointDAO {
   
   public List<PointDTO> myPoint(int idx,int ls,int cp);
   public int savePoint(String email,int savePoint);
   public int usePoint(String email,int usePoint);
   public int getPoint(int idx);
   public int getMyPointTotal(int idx);
}