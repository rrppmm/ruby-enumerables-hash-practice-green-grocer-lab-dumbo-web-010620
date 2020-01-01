def consolidate_cart(cart)
  new_cart = {}
  
  cart.each do |item|
    item.each do |k, v|
      if !new_cart[k]
        new_cart[k] = v
        new_cart[k][:count] = 1
      else
        new_cart[k][:count] += 1
      end
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  hash = cart
  coupons.each do |coupon_hash|
    
    item = coupon_hash[:item]

    if !hash[item].nil? && hash[item][:count] >= coupon_hash[:num]
      temp = {"#{item} W/COUPON" => {
        :price => coupon_hash[:cost] / 2,
        :clearance => hash[item][:clearance],
        :count => 2
        }
      }
      
      if hash["#{item} W/COUPON"].nil?
        hash.merge!(temp)
      else
        hash["#{item} W/COUPON"][:count] += 1
      end
      
      hash[item][:count] -= coupon_hash[:num]
    end
  end
  hash
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
