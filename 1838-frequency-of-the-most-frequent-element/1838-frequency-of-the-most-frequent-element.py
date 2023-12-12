class Solution:
    def maxFrequency(self, nums: List[int], k: int) -> int:
        nums.sort()
        left = 0 
        right = 0
        total = 0
        maxi= 0
        length = len (nums)
        while right < length :
            total = total +nums[right]
            
            while nums[right]*(right-left+1)>total +k:
                total = total- nums[left]
                left +=1
            
            maxi = max(right -left +1,maxi)
            right +=1
        return maxi