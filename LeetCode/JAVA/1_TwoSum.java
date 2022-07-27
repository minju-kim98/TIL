//Brute Force
class Solution {
    public int[] twoSum(int[] nums, int target) {
        int l = nums.length;
        
        for(int i = 0; i < l; i++){
            for(int j = i + 1; j < l; j++){
                if (nums[i] + nums[j] == target){
                    return new int[]{i, j};
                }
            }
        }
        
        return new int[]{};
    }
}

//HashTable
class Solution{
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> map = new HashMap<>();

        for(int i = 0; i < nums.length; i++){
            if(map.containsKey(nums[i])){
                return new int[]{map.get(nums[i]), i};
            }
            map.put(target - nums[i], i);
        }

        return new int[]{};
    }
}