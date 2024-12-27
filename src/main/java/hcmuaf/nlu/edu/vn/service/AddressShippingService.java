package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.address_shipping.AddressSippingDao;
import hcmuaf.nlu.edu.vn.model.ShippingAddress;

public class AddressShippingService {
    private final AddressSippingDao addressSippingDao;

    public AddressShippingService() {
        this.addressSippingDao = new AddressSippingDao();
    }


    //Cập nhật thông tin giao hàng
    public boolean updateInfoShipping(int userId, String email, String name, String address, String phoneNumber, String note) {
        if (addressSippingDao.checkInfo(userId)) {
            return addressSippingDao.updateInfoShipping(userId, email, name, address, phoneNumber, note);
        }else {
            return addressSippingDao.insertInfoShipping(userId, email, name, address, phoneNumber, note);
        }
    }

    //Lấy thông tin giao hàng
    public ShippingAddress getInfoShippingAddress(int userId) {
        return addressSippingDao.getInfoShipping(userId);
    }

}

