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
     result = {}
  cart.each do |food, info|
    coupons.each do |coupon|
      if food == coupon[:item] && info[:count] >= coupon[:num]
        info[:count] =  info[:count] - coupon[:num]
        if result["#{food} W/COUPON"]
          result["#{food} W/COUPON"][:count] += 1
        else
          result["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
        end
      end
    end
    result[food] = info
  end
  result
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
