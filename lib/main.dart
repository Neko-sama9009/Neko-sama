List<List<int>> findPairWithSum(List<int> numbers, int target)
{
  List<List<int>> pair = [];
  for(int i = 0; i < numbers.length; i++){
    for(int j = i + 1; j < numbers.length; j++){
      if(numbers[i] + numbers[j] == target){
        pair.add([i,j]);
        return pair;
      }
    }
  }
  return pair;
}
void main(){
  List<int> nums = [2,7,11,15,-2];
  List<List<int>> result = [];
  result = findPairWithSum(nums,9);
  print('vi tri cac cap co tong bang 9: $result');
}
