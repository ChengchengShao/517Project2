task :cancel_reservation_30mins => :environment do

  begin
    Car.joins("LEFT JOIN reservations on cars.id = reservations.car_id").where("reservations.checkout_time < ? and reservations.status = ?", (Time.zone.now-5.minutes).to_s, 'reserved').update_all(:status => 'available')
  end

  begin
    Reservation.where("checkout_time < ? and status = ?", (Time.zone.now-5.minutes).to_s, 'reserved').update_all(:status => 'cancled')
  end


end

