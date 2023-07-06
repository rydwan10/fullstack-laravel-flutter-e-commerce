import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Dashboard',
    icon: 'home-outline',
    link: '/pages/dashboard',
    home: true,
  },
  {
    title: "Transaction",
    group: true
  },
  {
    title: "Transactions",
    icon: "shopping-bag-outline",
    link: "/pages/transactions"
  },
  {
    title: "Shipping",
    icon: "car-outline",
    link: "/pages/shipping"
  },
  {
    title: 'Data Management',
    group: true,
  },
  {
    title: 'Products',
    icon: 'cube-outline',
    link: '/pages/products'
  },
  {
    title: 'Categories',
    icon: 'book-outline',
    link: '/pages/categories'
  },
  {
    title: 'Discounts',
    icon: 'pricetags-outline',
    link: '/pages/discounts'
  },
  {
    title: "User Manangement",
    group: true,
  },
  {
    title: "Admin Management",
    icon: 'people-outline',
    link: '/pages/admin-management'
  }
  
  // {
  //   title: 'Auth',
  //   icon: 'lock-outline',
  //   children: [
  //     {
  //       title: 'Login',
  //       link: '/auth/login',
  //     },
  //     {
  //       title: 'Register',
  //       link: '/auth/register',
  //     },
  //     {
  //       title: 'Request Password',
  //       link: '/auth/request-password',
  //     },
  //     {
  //       title: 'Reset Password',
  //       link: '/auth/reset-password',
  //     },
  //   ],
  // },
];
