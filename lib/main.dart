void main() {
  //BÀI TẬP:
  if (true) {
    List<List<int>> findPairWithSum(List<int> numbers, int target) {
      List<List<int>> pair = [];//để lưu vị trí các cặp số có tổng = 9
      for (int i = 0; i < numbers.length; i++) {
        for (int j = i + 1; j < numbers.length; j++) {
          //tạo 2 vòng lặp làm mảng 2 chiều
          if (numbers[i] + numbers[j] == target) {
            pair.add([i, j]);
            //thêm List 1 chiều  [i,j] vào list 2 chiều pair
            return pair;
            //trả về giá trị pair rồi kết thúc vòng lặp vì chỉ cần lấy               cặp đầu tiên
          }
        }
      }
      return pair; //trả về giá trị cho hàm
    }

    List<int> nums = [2, 7, 11, 15, -2];
    List<List<int>> result = findPairWithSum(nums, 9);
    print('Vị trí các cặp có tổng bằng 9: $result');
  }
  //NÂNG CAO
  if (true){
    List<List<int>> findPairWithSum(List<int> numbers, repair){
      Map<int,int> numMap = {};
      List<List<int>> pairs = []; //chứa vị trí cặp đầu có tổng bằng 9
      for(int i = 0; i<numbers.length;i++){
        int difference = repair - numbers[i];
        //gọi số cần tìm khi cộng với number[i] = 9 là difference
        if(numMap.containsKey(difference)){
          //kiểm tra difference có nằm trong numMap hay không
          pairs.add([numMap[difference]!, i]);
          //nếu có thì thêm vị trí của difference và (i: đại diện cho vị trí của numbers) vào pairs
          return pairs;}
        //trả về giá trị rồi kết thúc vòng lặp vì chỉ cần cặp đầu tiên
        else{
          numMap[numbers[i]] = i;
          // thêm vị trí của number[i] vào numMap nếu difference chưa có trong numMap, nếu có rồi thì thôi để tránh bị trùng.
        }
        // numMap = [['0',2],['1',7],['2',11],['3',15],['4',-2]]
      }
      return pairs;
    }
    List<int> nums = [2, 7, 11, 15, -2];
    List<List<int>> result = [];
    result = findPairWithSum(nums, 9);
    print('Vị trí các cặp có tổng bằng 9: $result');
  }
}
