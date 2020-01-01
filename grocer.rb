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
   coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      if cart[coupon[:item]][:count] >= coupon[:num]
        itemwithCoupon = "#{coupon[:item]} W/COUPON"
        if cart[itemwithCoupon]
          cart[itemwithCoupon][:count] += coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        else
          cart[itemwithCoupon] = {}
          cart[itemwithCoupon][:price] = (coupon[:cost] / coupon[:num])
          cart[itemwithCoupon][:clearance] = cart[coupon[:item]][:clearance]
          cart[itemwithCoupon][:count] = coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        end
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, price_hash|
    if price_hash[:clearance] == true
      price_hash[:price] = (price_hash[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  total = 0 
  new_cart = consolidate_cart(cart) 
  coupon_cart = apply_coupons(new_cart, coupons) 
  clearance_cart = apply_clearance(coupon_cart) 
  clearance_cart.each do |item, attribute_hash| 
    total += (attribute_hash[:price] * attribute_hash[:count])
  end 
  total = (total * 0.9) if total > 100 total 
end
