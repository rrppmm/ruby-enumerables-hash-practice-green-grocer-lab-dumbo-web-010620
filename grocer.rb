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
    new_hash = {}
    cart.each do |vegetable, properties|
      if !new_hash[vegetable]
        new_hash[vegetable] = properties
      end
      coupons.each do |hash|
        hash.each do |coupon_key, coupon_value|
          if coupon_value == vegetable
            if !new_hash["#{vegetable} W/COUPON"]
              new_hash["#{vegetable} W/COUPON"] = {:price => hash[:cost], :clearance => cart[vegetable][:clearance], :count => 0}
            end
            if !(new_hash[vegetable][:count] < hash[:num])
              new_hash[vegetable][:count] -= hash[:num]
              new_hash["#{vegetable} W/COUPON"][:count] += 1
            end
          end
        end
      end
    end
    new_hash
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
